Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184164;
	b=ZIs2j6sOIz0hddgu8oca/6mQhhVemGndwLs+M2scNkrbyVvQlX8FGyUmqL60rp7i7wJJ
	 Hp65MjyY4sYFBQ/Vaa/RbgWy9/WcfVYIy8Hgsip5YgebOsHjtB3b3NG0O4FB1FVMAk3gT
	 isF3GCi/6/PYQ9UO5wSX+My8PaHhg72ihfVVgHAL/d97cK9eGiCMzBr+t2/LHtjIHYjWD
	 PoURBkG4TuQzJlvwEWzaexF+yCdxUZFBwyDgZM/Nsl/jYr7SIOXtUxIvmnpVwuNUm5C7D
	 lbsmE0MDYHBvoZd2ER5WT+r8GXuHcPZOUip58Lefl6Op5AFAOxKB0NYoDZ+lXWjy7kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6tLbfq+cZnF/5nhM51bRIh+T/6W7SJLuUTl2FfRow+4=;
	b=TLx9zjUdhiCKxB6EjdlQX5Agk9BnnKY4witlwsrjJ5Nt1pla6kkm9G/08G9U+PIyfci3
	 x+o4bDzvuz7jJ1xvwwCFWgqSUJwWgi/X0vxIx0JrQhdAjDc8rt/FejePOH2rI2AQMFqjm
	 TPPLbl8ZU1eaR3ib8Hx8t23i/mQKeInvsM4CaZmvzHKvKZIJyl2U1hD8n0xv5IysAyvn7
	 LrF2dBh6BROQrzyYb9BN0g5LlQ7KREs6ZUXGDg6NqrmR3l3BLKPVKPAml4PAhLo6pDNtW
	 50OaqT93UoELQ/oOeQeG9ke16YN5ygY2HMr8+PqsP8Lf+QzrVtCcwxN4bC5b5pVOFyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cvmYRTsO;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF69606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FF69606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cvmYRTsO
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3535a54bed9so1166584eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184163; x=1793788963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tLbfq+cZnF/5nhM51bRIh+T/6W7SJLuUTl2FfRow+4=;
        b=cvmYRTsO6ZCeiu7WOEjMntIFpn/wevrWu1dNqSQtOjB1tbyGo9TWg7SsTHAD9v9310
         w2giSBPR/A/sTN8ddsvj7A9GEBLzSiBdhCajKcSj9XAb5tW5Qj6WXKUcSwhBZ1WNzeqm
         QpHOM9/p8wqQ1tRZ0wGkUx5u5lDfD8Vm944+j1ygWINLvj2NgBY0Oshx0n/ftWw1g2DE
         fhl47EjH2TsRJj6lw1U2oNqqNIihhoVc3rZ1lfgn4FV4ikAKGq6dsruF6jzalUILjTGq
         z1EsD+ZMxWcbmTKRIe/XNaDAGNtSBGgexu/tkWs/v0LQZw6/Qk1Lazrzi7Twfwmczviq
         glSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184163; x=1793788963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6tLbfq+cZnF/5nhM51bRIh+T/6W7SJLuUTl2FfRow+4=;
        b=HlliGNkFdF4pcIXM6FanVjCYQEn6LsyjcNQvIWNOSuPnWS6GEeMMlUHPf0xZSampbh
         OQOzUuDh42FkTDUkYb3CDJfypov7ufJqiRE9Ds7Jl1FDn1phVJRiQpIdg24Un1xrp1k9
         Bhz5hZy/FvyGyjmtVQxf2xHoxxYgPrn+xYXRQoWYmX0wbypZ6iEtMCy6F7fJ906fz69c
         tSiS9AP6bearsXO2bRyQFnPMgkiSgq9thqOFBaHd/wKvOxvjHULR4n1icxPjHDY7LmWJ
         z+PUo4w/kef82SKXmuwYdpjrfVW1AO6JsvMYgRIbf31kuSJnxFrX5vOwkwYR1Y5cyGFW
         n5jg==
X-Forwarded-Encrypted: i=1; AKwUvBwPzU6lnTF8Nyd7ppR+m1s2g2brrb/JOLdBvlC2f1uAF/8sbzXEkgt25ekU+b2iOkTHwCl9DCdPBx26NOQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLL8iQR114eGBN6wDLvT6Bap6g/pUOAKUcCGASMqgKwVJ07zwk
	mjxlfvmq4o1F19ppMsnDJLKkxh7fSoskw2OGDORtjC9JZOotL/C7f4m/
X-Gm-Gg: AYBFou0OPBpflfZgfZM3Aa4PV7BtGCYVuz4zdoo4remaBNVnGodemX7Kz0eL68zPZQ7
	zEkFwy4/4olBcxoqXK8xEpLSG/0+XtpiA/DMQS2z/li6Y4+YqlLHicrBrXbY2+k5kswpZiSG3iZ
	wlk8BmllrKAa7Rn28EDCRpPQ+FXwtgNtHH7otqFwmTPk6ctGV3cthyJdayjRp+pBXXvcrD8LQHo
	d2HX0KAtUh7tNiesHVM8Ja64I5N5zqH9ZD3hX8SAxRWhHLzCM+WcW4KFchhS7lDACw6ulRk4Cr0
	ftNPHjGdLHt/sraKObUtLY5NJjMsBpVF1+F4UkHUHp87b8x4ViDPgJWEmY/KJ8CCUu4vxOXuACS
	/AG4jvj6GnnQWk3HR2OWZz9pqIMmfYIb/H4vz8K4XR0AJOR5YPbKUfZYVNglZPmJcWIztzpHcU6
	o7xLPkTmFdrW3lUtTE8eMTufnc6o8y6V9Vg/V/IeT6ZB3c3LVhXHWZsTCWCX580amiSR3Qpq9s4
	pg48s/K5bApzKSEwfGlKs/8pUufZE13QenHK+WwgDarhf5wC/k5HI/MVOEOOqKB/r0eNqO+gpMR
	rJO+UvNSmXN7p4BadBXpvDkH+431z77QLra2yZgQ0QiIW0UZ6gWwgqprxMjEfs50VVhOesoHLqt
	ITknsMooBmtL/PQhLZ1oj9zPcdKQ5E7sXoDFSXh6SUh6g
X-Received: by 2002:a05:693c:41d7:20b0:367:3d68:8480 with SMTP id 5a478bee46e88-36a20115c41mr2784532eec.0.1793184163100;
        Wed, 28 Oct 2026 03:42:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da3e1sm7531469eec.8.2026.10.28.03.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:42:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: img: img-i2s-in: Fix clock leak on probe failure
Date: Wed, 28 Oct 2026 17:42:22 +0700
Message-ID: <20261028104223.27007-2-phucduc.bui@gmail.com>
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

The error path of img_i2s_in_probe() only suspends the device by hand
when runtime PM is not enabled, and otherwise relies on the
asynchronous suspend request queued by pm_runtime_put(). The
pm_runtime_disable() call that follows cancels that request if it is
still pending, leaving the sys clock enabled. This happens in particular
when the reset control lookup returns -EPROBE_DEFER.

Disable runtime PM first and then suspend the device by hand if it is
not suspended, as img_i2s_in_dev_remove() does. On the -EPROBE_DEFER
path, use pm_runtime_put_noidle() instead of pm_runtime_put(), as there
is no point in queuing a suspend request that gets cancelled right away.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/img/img-i2s-in.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index a0c87e2a9b30..0c136dca186c 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -490,7 +490,7 @@ static int img_i2s_in_probe(struct platform_device *pdev)
 	if (IS_ERR(rst)) {
 		if (PTR_ERR(rst) == -EPROBE_DEFER) {
 			ret = -EPROBE_DEFER;
-			pm_runtime_put(&pdev->dev);
+			pm_runtime_put_noidle(&pdev->dev);
 			goto err_suspend;
 		}
 
@@ -534,8 +534,12 @@ static int img_i2s_in_probe(struct platform_device *pdev)
 	return 0;
 
 err_suspend:
-	if (!pm_runtime_enabled(&pdev->dev))
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
 		img_i2s_in_runtime_suspend(&pdev->dev);
+
+	return ret;
+
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.43.0

